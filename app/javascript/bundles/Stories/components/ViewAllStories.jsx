import React, { useState, useEffect } from 'react';
import Paper from '@material-ui/core/Paper';
import { TreeDataState } from '@devexpress/dx-react-grid';
import { CustomTreeData } from '@devexpress/dx-react-grid';
import { Grid } from '@devexpress/dx-react-grid-material-ui';
import { VirtualTable } from '@devexpress/dx-react-grid-material-ui';
import { TableHeaderRow } from '@devexpress/dx-react-grid-material-ui';
import { TableTreeColumn } from '@devexpress/dx-react-grid-material-ui';
import { TableFilterRow } from '@devexpress/dx-react-grid-material-ui';
import { FilteringState } from '@devexpress/dx-react-grid'
import { EditingState } from '@devexpress/dx-react-grid';
import { TableEditRow } from '@devexpress/dx-react-grid-material-ui';
import { TableEditColumn } from '@devexpress/dx-react-grid-material-ui';
import { SortingState } from '@devexpress/dx-react-grid';
import CreateConsumer from '../../../channels/consumer'
import consumer from '../../../channels/consumer'

const STORIES_URL = '/stories/search';
const ARTICLES_URL = '/articles/search';
const ROOT_ID = '-1';
const getRowId = row =>`${row.id}_${row.type}`;

const getChildRows = (row, rootRows) => {
  var childRows = []
  if (row) {
    childRows = rootRows.filter(r => r.story_id == row.id && row.type == 'story' && r.type === 'article' );
  } else {
    childRows = rootRows.filter(r => r.story_id == ROOT_ID );
  }
  if (childRows.length) {
    return childRows;
  }
  return row && row.hasItems ? [] : null;
};

export default () => {
  consumer.subscriptions.create("ArticlesChannel", {
    received(event) {
      if (data.length > 0) {
        setReloadRequired(true)
      }
    }
  });

  consumer.subscriptions.create("StoriesChannel", {
    received(event) {
      if (data.length > 0) {
        setReloadRequired(true)
      }
    }
  });

  const OnScaffoldClick = (e) => {
    e.preventDefault();
    var url = e.target.getAttribute('data-link')

    fetch(url, { method: 'POST', mode: 'cors' }).then(response => response.json());
  };

  const [reloadRequired, setReloadRequired] = useState([false])

  const [columns] = useState([
    { name: 'id', title: 'Id' },
    { name: 'name', title: 'Name' },
    { name: 'created_at', title: 'Created At', getCellValue: row => new Date(Date.parse(row.created_at)).toLocaleString() },
    { name: 'updated_at', title: 'Updated At', getCellValue: row => new Date(Date.parse(row.updated_at)).toLocaleString() },
    { name: 'totals.facebook', title: 'Total Facebook Articles', getCellValue: row => { 
        if (row.totals) { 
          return row.totals.facebook 
        } else { 
          return row.type == 'article' ? row.content : '' 
        } 
      }
    },
    { name: 'totals.tweet', title: 'Total Tweeter Articles', getCellValue: row => { 
        if (row.totals) { 
          return row.totals.tweet 
        } else { 
          return row.type == 'article' ? row.source : '' 
        } 
      } 
    },
    { name: 'totals.blog', title: 'Total Blog Articles', getCellValue: row => row.totals ? row.totals.blog : '' },
    { name: 'totals.other', title: 'Total Other Articles', getCellValue: row => row.totals ? row.totals.other : '' },
    { name: 'last_article.id', title: 'Last Article ID', getCellValue: row => row.last_article ? row.last_article.id : '' },
    { name: 'last_article.name', title: 'Last Article Name', getCellValue: row => row.last_article ? row.last_article.name : '' },
    { name: 'scaffoldAction', title: '', getCellValue: row => {
      if (row.type == 'story') {
        var url = `/articles/scaffold?story_id=${row.id}`;
        return <div data-link={url} onClick={OnScaffoldClick}> Scaffold </div> 
      }
    }}
  ]);

  const [sorting, setSorting] = useState([{ columnName: 'id', direction: 'asc' }]);
  const [data, setData] = useState([]);

  const [tableColumnExtensions] = useState([
    { columnName: 'name', width: 350 },
    { columnName: 'created_at', width: 200, align: 'right' },
    { columnName: 'updated_at', width: 200, align: 'right' },
    { columnName: 'totals.facebook', width: 350, align: 'center' },
    { columnName: 'totals.tweet', width: 200, align: 'center' },
    { columnName: 'totals.other', width: 200, align: 'center' },
    { columnName: 'totals.blog', width: 200, align: 'center' },
    { columnName: 'last_article.id', width: 200, align: 'center' },
    { columnName: 'last_article.name', width: 200, align: 'center' }
  ]);

  const [filteringStateColumnExtensions] = useState([
    { columnName: 'id', filteringEnabled: false }, 
    { columnName: 'name', filteringEnabled: true }, 
    { columnName: 'created_at', filteringEnabled: false }, 
    { columnName: 'updated_at', filteringEnabled: false }, 
    { columnName: 'totals.facebook', filteringEnabled: false }, 
    { columnName: 'totals.tweet', filteringEnabled: false }, 
    { columnName: 'totals.other', filteringEnabled: false }, 
    { columnName: 'totals.blog', filteringEnabled: false }, 
    { columnName: 'last_article.id', filteringEnabled: false }, 
    { columnName: 'last_article.name', filteringEnabled: false },
    { columnName: 'scaffoldAction', filteringEnabled: false }
  ]);

  const [expandedRowIds, setExpandedRowIds] = useState([]);
  const [loadingStories, setLoadingStories] = useState(false);
  const [loadingArticles, setLoadingArticles] = useState(false);
  const [filters, setFilters] = useState([]);
  const [lastQuery, setLastQuery] = useState();

  const getQueryString = () => {
    const sortingStr = encodeURIComponent(`${sorting[0].columnName} ${sorting[0].direction}`)
    const condition = encodeURIComponent(filters[0] ? filters[0].value : '')

    return `filter[condition]=${condition}&filter[order]=${sortingStr}`;
  };

  const dataChangeReceived = () => {
    debugger;
  };

  const loadStoriesData = () => {
    const queryString = getQueryString();
    if (queryString == lastQuery && !reloadRequired) return;

    if (loadingStories) return;
    setLoadingStories(true);
    fetch(`${STORIES_URL}?${queryString}`, { mode: 'cors' }).then(response => response.json()).then((loadedData) => {
      setData(loadedData.stories);
      setLastQuery(queryString);
      setLoadingStories(false);
      setReloadRequired(false);
    });
    setLastQuery(queryString);
  };

  const loadArticlesData = () => {
    const rowIdsWithNotLoadedChilds = [ROOT_ID, ...expandedRowIds]
      .filter(rowId => data.findIndex(row => row.story_id == rowId.split('_')[0]) === -1);
    if (rowIdsWithNotLoadedChilds.length > 0) {
      if (loadingArticles) return;
      setLoadingArticles(true);
      Promise.all(rowIdsWithNotLoadedChilds
        .map(rowId => fetch(`${ARTICLES_URL}?filter[story_id]=${rowId.split('_')[0]}&${getQueryString()}`, { mode: 'cors' })
          .then(response => response.json())))
        .then((loadedData) => {
          setData(data.concat(...loadedData[0].articles));
          setLoadingArticles(false);
        })
        .catch(() => setLoadingArticles(false));
    }
  };

  const commitChanges = ({ added, changed, deleted }) => {
    if (deleted) {
      var params = deleted[0].split('_')
      var url = params[1] == 'story' ? `/stories/${params[0]}` : `/articles/${params[0]}`

      fetch(url, { method: 'DELETE', mode: 'cors' }).then(response => response.json());
    }
  };

  useEffect(() => {
    if (!loadingArticles && data.length != 0) {
      loadArticlesData();
    }
    if (!loadingStories) {
      loadStoriesData();
    }
  });


  return (
    <> 
    <div data-link='/stories/scaffold' onClick={OnScaffoldClick}> Scaffold Story </div> 
    <Grid rows={data} columns={columns} getRowId={getRowId}>
      <TreeDataState expandedRowIds={expandedRowIds} onExpandedRowIdsChange={setExpandedRowIds} />
      <CustomTreeData getChildRows={getChildRows} />
      <FilteringState onFiltersChange={setFilters} columnExtensions={filteringStateColumnExtensions} />
      <EditingState onCommitChanges={commitChanges} />
      <SortingState sorting={sorting} onSortingChange={setSorting} />
      <VirtualTable columnExtensions={tableColumnExtensions} height='1024px'/>
      <TableHeaderRow showSortingControls />
      <TableFilterRow />
      <TableEditRow />
      <TableEditColumn showDeleteCommand />
      <TableTreeColumn for="id"/>
    </Grid>
    </>
  );
}
